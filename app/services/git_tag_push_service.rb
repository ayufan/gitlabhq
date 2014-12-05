class GitTagPushService
  attr_accessor :project, :user, :push_data

  def execute(project, user, oldrev, newrev, ref)
    @project, @user = project, user
    @push_data = create_push_data(oldrev, newrev, ref)

    EventCreateService.new.push(project, user, @push_data)
    project.repository.expire_cache
    project.execute_hooks(@push_data.dup, :tag_push_hooks)

    if project.gitlab_ci?
      project.gitlab_ci_service.async_execute(@push_data)
    end

    true
  end

  private

  def create_push_data(oldrev, newrev, ref)
    commits = []
    message = nil

    if newrev != Gitlab::Git::BLANK_SHA
      tag_name = ref.sub(/\Arefs\/(heads|tags)\//, '')
      tag = project.repository.find_tag(tag_name)
      if tag
        commit = project.repository.commit(tag.target)
        commits = [commit].compact
        message = tag.message
      end
    end

    Gitlab::PushDataBuilder.
      build(project, user, oldrev, newrev, ref, commits, message)
  end
end
