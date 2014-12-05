require 'spec_helper'

describe GitTagPushService do
  include RepoHelpers

  let (:user) { create :user }
  let (:project) { create :project }
  let (:service) { GitTagPushService.new }

  before do
    @oldrev = sample_commit.parent_id
    @newrev = sample_commit.id
    @ref = 'refs/tags/super-tag'
  end

  describe 'Push tags' do
    context 'new tag' do
      subject do
        service.execute(project, user, @blankrev, @newrev, @ref)
      end

      it { should be_true }
    end

    context 'existing tag' do
      subject do
        service.execute(project, user, @oldrev, @newrev, @ref)
      end

      it { should be_true }
    end

    context 'rm tag' do
      subject do
        service.execute(project, user, @oldrev, @blankrev, @ref)
      end

      it { should be_true }
    end
  end

  describe 'Git Tag Push Data' do
    before do
      service.execute(project, user, @oldrev, @newrev, @ref)
      @push_data = service.push_data
      @commit = project.repository.commit(@newrev)
    end

    subject { @push_data }

    it { is_expected.to include(ref: @ref) }
    it { is_expected.to include(before: @oldrev) }
    it { is_expected.to include(after: @newrev) }
    it { is_expected.to include(user_id: user.id) }
    it { is_expected.to include(user_name: user.name) }
    it { is_expected.to include(project_id: project.id) }

    context 'With repository data' do
      subject { @push_data[:repository] }

      it { is_expected.to include(name: project.name) }
      it { is_expected.to include(url: project.url_to_repo) }
      it { is_expected.to include(description: project.description) }
      it { is_expected.to include(homepage: project.web_url) }
    end

    context "with commits" do
      subject { @push_data[:commits] }

      it { should be_an(Array) }
      it { should have(1).element }

      context "the commit" do
        subject { @push_data[:commits].first }

        it { should include(id: @commit.id) }
        it { should include(message: @commit.safe_message) }
        it { should include(timestamp: @commit.date.xmlschema) }
        it { should include(url: "#{Gitlab.config.gitlab.url}/#{project.to_param}/commit/#{@commit.id}") }

        context "with a author" do
          subject { @push_data[:commits].first[:author] }

          it { should include(name: @commit.author_name) }
          it { should include(email: @commit.author_email) }
        end
      end
    end
  end

  describe "Web Hooks" do
    context "execute web hooks" do
      it "when pushing tags" do
        expect(project).to receive(:execute_hooks)
        service.execute(project, user, 'oldrev', 'newrev', 'refs/tags/v1.0.0')
      end

      it "when pushing branch" do
        project.should_not_receive(:execute_hooks)
        service.execute(project, user, 'newrev', 'newrev', 'refs/heads/master')
      end
    end
  end
end
