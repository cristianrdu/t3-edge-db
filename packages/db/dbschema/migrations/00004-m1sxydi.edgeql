CREATE MIGRATION m1sxydi62nrrcscob3wzv53zzsyr6kp57vixtrtaupkurwd2i4ixpa
    ONTO m1ylxmnxq4yq6vff452tpuwr5hojymvmge5ut2ty7yp2xhddp5npta
{
  ALTER TYPE default::BlogPost {
      DROP PROPERTY content;
  };
  ALTER TYPE default::BlogPost RENAME TO default::Label;
  CREATE TYPE default::GitHubUser {
      CREATE PROPERTY avatarUrl: std::str;
      CREATE PROPERTY bio: std::str;
      CREATE PROPERTY blog: std::str;
      CREATE PROPERTY company: std::str;
      CREATE PROPERTY createdAt: std::str;
      CREATE PROPERTY email: std::str;
      CREATE PROPERTY eventsUrl: std::str;
      CREATE PROPERTY followers: std::int64;
      CREATE PROPERTY followersUrl: std::str;
      CREATE PROPERTY following: std::int64;
      CREATE PROPERTY followingUrl: std::str;
      CREATE PROPERTY gistsUrl: std::str;
      CREATE PROPERTY gravatarId: std::str;
      CREATE PROPERTY hireable: std::bool;
      CREATE PROPERTY htmlUrl: std::str;
      CREATE PROPERTY location: std::str;
      CREATE PROPERTY login: std::str;
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY nodeId: std::str;
      CREATE PROPERTY organizationsUrl: std::str;
      CREATE PROPERTY publicGists: std::int64;
      CREATE PROPERTY publicRepos: std::int64;
      CREATE PROPERTY receivedEventsUrl: std::str;
      CREATE PROPERTY reposUrl: std::str;
      CREATE PROPERTY siteAdmin: std::bool;
      CREATE PROPERTY starredUrl: std::str;
      CREATE PROPERTY subscriptionsUrl: std::str;
      CREATE PROPERTY twitterUsername: std::str;
      CREATE PROPERTY type: std::str;
      CREATE PROPERTY updatedAt: std::str;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::Reaction {
      CREATE PROPERTY confused: std::int64;
      CREATE PROPERTY eyes: std::int64;
      CREATE PROPERTY heart: std::int64;
      CREATE PROPERTY hooray: std::int64;
      CREATE PROPERTY laugh: std::int64;
      CREATE PROPERTY minusOne: std::int64;
      CREATE PROPERTY plusOne: std::int64;
      CREATE PROPERTY rocket: std::int64;
      CREATE PROPERTY totalCount: std::int64;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::Issue {
      CREATE MULTI LINK assignees: default::GitHubUser;
      CREATE LINK user: default::GitHubUser;
      CREATE MULTI LINK labels: default::Label;
      CREATE LINK reactions: default::Reaction;
      CREATE PROPERTY activeLockReason: std::str;
      CREATE PROPERTY assignee: std::str;
      CREATE PROPERTY authorAssociation: std::str;
      CREATE PROPERTY body: std::str;
      CREATE PROPERTY closedAt: std::datetime;
      CREATE PROPERTY comments: std::int64;
      CREATE PROPERTY commentsUrl: std::str;
      CREATE PROPERTY createdAt: std::datetime;
      CREATE PROPERTY eventsUrl: std::str;
      CREATE PROPERTY htmlUrl: std::str;
      CREATE PROPERTY labelsUrl: std::str;
      CREATE PROPERTY locked: std::bool;
      CREATE PROPERTY milestone: std::str;
      CREATE PROPERTY nodeId: std::str;
      CREATE PROPERTY number: std::int64;
      CREATE PROPERTY performedViaGithubApp: std::str;
      CREATE PROPERTY repositoryUrl: std::str;
      CREATE PROPERTY state: std::str;
      CREATE PROPERTY stateReason: std::str;
      CREATE PROPERTY timelineUrl: std::str;
      CREATE PROPERTY title: std::str;
      CREATE PROPERTY updatedAt: std::datetime;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::License {
      CREATE PROPERTY key: std::str;
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY node_id: std::str;
      CREATE PROPERTY spdx_id: std::str;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::Permissions {
      CREATE PROPERTY admin: std::bool;
      CREATE PROPERTY maintain: std::bool;
      CREATE PROPERTY pull: std::bool;
      CREATE PROPERTY push: std::bool;
      CREATE PROPERTY triage: std::bool;
  };
  CREATE TYPE default::RepoOwner {
      CREATE PROPERTY avatar_url: std::str;
      CREATE PROPERTY events_url: std::str;
      CREATE PROPERTY followers_url: std::str;
      CREATE PROPERTY following_url: std::str;
      CREATE PROPERTY gists_url: std::str;
      CREATE PROPERTY gravatar_id: std::str;
      CREATE PROPERTY html_url: std::str;
      CREATE PROPERTY login: std::str;
      CREATE PROPERTY node_id: std::str;
      CREATE PROPERTY organizations_url: std::str;
      CREATE PROPERTY received_events_url: std::str;
      CREATE PROPERTY repos_url: std::str;
      CREATE PROPERTY site_admin: std::bool;
      CREATE PROPERTY starred_url: std::str;
      CREATE PROPERTY subscriptions_url: std::str;
      CREATE PROPERTY type: std::str;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::GitHubRepo {
      CREATE MULTI LINK issues: default::Issue;
      CREATE LINK license: default::License;
      CREATE LINK owner: default::RepoOwner;
      CREATE LINK permissions: default::Permissions;
      CREATE PROPERTY allow_forking: std::bool;
      CREATE PROPERTY archive_url: std::str;
      CREATE PROPERTY archived: std::bool;
      CREATE PROPERTY assignees_url: std::str;
      CREATE PROPERTY blobs_url: std::str;
      CREATE PROPERTY branches_url: std::str;
      CREATE PROPERTY clone_url: std::str;
      CREATE PROPERTY collaborators_url: std::str;
      CREATE PROPERTY comments_url: std::str;
      CREATE PROPERTY commits_url: std::str;
      CREATE PROPERTY compare_url: std::str;
      CREATE PROPERTY contents_url: std::str;
      CREATE PROPERTY contributors_url: std::str;
      CREATE PROPERTY created_at: std::datetime;
      CREATE PROPERTY default_branch: std::str;
      CREATE PROPERTY deployments_url: std::str;
      CREATE PROPERTY description: std::str;
      CREATE PROPERTY disabled: std::bool;
      CREATE PROPERTY downloads_url: std::str;
      CREATE PROPERTY events_url: std::str;
      CREATE PROPERTY fork: std::bool;
      CREATE PROPERTY forks: std::int64;
      CREATE PROPERTY forks_count: std::int64;
      CREATE PROPERTY forks_url: std::str;
      CREATE PROPERTY full_name: std::str;
      CREATE PROPERTY git_commits_url: std::str;
      CREATE PROPERTY git_refs_url: std::str;
      CREATE PROPERTY git_tags_url: std::str;
      CREATE PROPERTY git_url: std::str;
      CREATE PROPERTY has_discussions: std::bool;
      CREATE PROPERTY has_downloads: std::bool;
      CREATE PROPERTY has_issues: std::bool;
      CREATE PROPERTY has_pages: std::bool;
      CREATE PROPERTY has_projects: std::bool;
      CREATE PROPERTY has_wiki: std::bool;
      CREATE PROPERTY homepage: std::str;
      CREATE PROPERTY hooks_url: std::str;
      CREATE PROPERTY html_url: std::str;
      CREATE PROPERTY is_template: std::bool;
      CREATE PROPERTY issue_comment_url: std::str;
      CREATE PROPERTY issue_events_url: std::str;
      CREATE PROPERTY issues_url: std::str;
      CREATE PROPERTY keys_url: std::str;
      CREATE PROPERTY labels_url: std::str;
      CREATE PROPERTY language: std::str;
      CREATE PROPERTY languages_url: std::str;
      CREATE PROPERTY merges_url: std::str;
      CREATE PROPERTY milestones_url: std::str;
      CREATE PROPERTY mirror_url: std::str;
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY network_count: std::int64;
      CREATE PROPERTY node_id: std::str;
      CREATE PROPERTY notifications_url: std::str;
      CREATE PROPERTY open_issues: std::int64;
      CREATE PROPERTY open_issues_count: std::int64;
      CREATE PROPERTY private: std::bool;
      CREATE PROPERTY pulls_url: std::str;
      CREATE PROPERTY pushed_at: std::datetime;
      CREATE PROPERTY releases_url: std::str;
      CREATE PROPERTY size: std::int64;
      CREATE PROPERTY ssh_url: std::str;
      CREATE PROPERTY stargazers_count: std::int64;
      CREATE PROPERTY stargazers_url: std::str;
      CREATE PROPERTY statuses_url: std::str;
      CREATE PROPERTY subscribers_count: std::int64;
      CREATE PROPERTY subscribers_url: std::str;
      CREATE PROPERTY subscription_url: std::str;
      CREATE PROPERTY svn_url: std::str;
      CREATE PROPERTY tags_url: std::str;
      CREATE PROPERTY teams_url: std::str;
      CREATE PROPERTY temp_clone_token: std::str;
      CREATE PROPERTY topics: array<std::str>;
      CREATE PROPERTY trees_url: std::str;
      CREATE PROPERTY updated_at: std::datetime;
      CREATE PROPERTY url: std::str;
      CREATE PROPERTY visibility: std::str;
      CREATE PROPERTY watchers: std::int64;
      CREATE PROPERTY watchers_count: std::int64;
      CREATE PROPERTY web_commit_signoff_required: std::bool;
  };
  ALTER TYPE default::Label {
      CREATE PROPERTY default: std::bool;
  };
  ALTER TYPE default::Label {
      CREATE PROPERTY description: std::str;
  };
  ALTER TYPE default::Label {
      CREATE PROPERTY name: std::str;
  };
  ALTER TYPE default::Label {
      ALTER PROPERTY title {
          RENAME TO color;
      };
  };
  ALTER TYPE default::Label {
      ALTER PROPERTY color {
          RESET OPTIONALITY;
      };
  };
};
