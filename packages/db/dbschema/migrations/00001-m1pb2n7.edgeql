CREATE MIGRATION m1pb2n7x3tlolchjwlmapy455djilnfkmokkhabjmefoohmzdybfva
    ONTO initial
{
  CREATE FUTURE nonrecursive_access_policies;
  CREATE TYPE default::Account {
      CREATE REQUIRED PROPERTY provider: std::str;
      CREATE REQUIRED PROPERTY providerAccountId: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE CONSTRAINT std::exclusive ON ((.provider, .providerAccountId));
      CREATE PROPERTY access_token: std::str;
      CREATE PROPERTY createdAt: std::datetime {
          SET default := (std::datetime_current());
      };
      CREATE PROPERTY expires_at: std::int64;
      CREATE PROPERTY id_token: std::str;
      CREATE PROPERTY refresh_token: std::str;
      CREATE PROPERTY scope: std::str;
      CREATE PROPERTY session_state: std::str;
      CREATE PROPERTY token_type: std::str;
      CREATE REQUIRED PROPERTY type: std::str;
  };
  CREATE TYPE default::User {
      CREATE PROPERTY createdAt: std::datetime {
          SET default := (std::datetime_current());
      };
      CREATE REQUIRED PROPERTY email: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE PROPERTY emailVerified: std::datetime;
      CREATE PROPERTY image: std::str;
      CREATE PROPERTY name: std::str;
  };
  ALTER TYPE default::Account {
      CREATE REQUIRED LINK user: default::User {
          ON TARGET DELETE DELETE SOURCE;
      };
      CREATE REQUIRED PROPERTY userId := (.user.id);
  };
  ALTER TYPE default::User {
      CREATE MULTI LINK accounts := (.<user[IS default::Account]);
  };
  CREATE TYPE default::GitHubUser {
      CREATE PROPERTY avatar_url: std::str;
      CREATE PROPERTY bio: std::str;
      CREATE PROPERTY blog: std::str;
      CREATE PROPERTY company: std::str;
      CREATE PROPERTY created_at: std::str;
      CREATE PROPERTY email: std::str;
      CREATE PROPERTY events_url: std::str;
      CREATE PROPERTY followers: std::int64;
      CREATE PROPERTY followers_url: std::str;
      CREATE PROPERTY following: std::int64;
      CREATE PROPERTY following_url: std::str;
      CREATE PROPERTY gists_url: std::str;
      CREATE PROPERTY gravatar_id: std::str;
      CREATE PROPERTY hireable: std::bool;
      CREATE PROPERTY html_url: std::str;
      CREATE PROPERTY location: std::str;
      CREATE PROPERTY login: std::str;
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY node_id: std::str;
      CREATE PROPERTY organizations_url: std::str;
      CREATE PROPERTY public_gists: std::int64;
      CREATE PROPERTY public_repos: std::int64;
      CREATE PROPERTY received_events_url: std::str;
      CREATE PROPERTY repos_url: std::str;
      CREATE PROPERTY site_admin: std::bool;
      CREATE PROPERTY starred_url: std::str;
      CREATE PROPERTY subscriptions_url: std::str;
      CREATE PROPERTY twitter_username: std::str;
      CREATE PROPERTY type: std::str;
      CREATE PROPERTY updated_at: std::str;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::Label {
      CREATE PROPERTY color: std::str;
      CREATE PROPERTY default: std::bool;
      CREATE PROPERTY description: std::str;
      CREATE PROPERTY name: std::str;
  };
  CREATE TYPE default::Reaction {
      CREATE PROPERTY confused: std::int64;
      CREATE PROPERTY eyes: std::int64;
      CREATE PROPERTY heart: std::int64;
      CREATE PROPERTY hooray: std::int64;
      CREATE PROPERTY laugh: std::int64;
      CREATE PROPERTY minus_one: std::int64;
      CREATE PROPERTY plus_one: std::int64;
      CREATE PROPERTY rocket: std::int64;
      CREATE PROPERTY total_count: std::int64;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::Issue {
      CREATE MULTI LINK assignees: default::GitHubUser;
      CREATE LINK user: default::GitHubUser;
      CREATE MULTI LINK labels: default::Label;
      CREATE LINK reactions: default::Reaction;
      CREATE PROPERTY active_lock_reason: std::str;
      CREATE PROPERTY assignee: std::str;
      CREATE PROPERTY author_association: std::str;
      CREATE PROPERTY body: std::str;
      CREATE PROPERTY closed_at: std::datetime;
      CREATE PROPERTY comments: std::int64;
      CREATE PROPERTY comments_url: std::str;
      CREATE PROPERTY created_at: std::datetime;
      CREATE PROPERTY events_url: std::str;
      CREATE PROPERTY html_url: std::str;
      CREATE PROPERTY labels_url: std::str;
      CREATE PROPERTY locked: std::bool;
      CREATE PROPERTY milestone: std::str;
      CREATE PROPERTY node_id: std::str;
      CREATE PROPERTY number: std::int64;
      CREATE PROPERTY performed_via_github_app: std::str;
      CREATE PROPERTY repository_url: std::str;
      CREATE PROPERTY state: std::str;
      CREATE PROPERTY state_reason: std::str;
      CREATE PROPERTY timeline_url: std::str;
      CREATE PROPERTY title: std::str;
      CREATE PROPERTY updated_at: std::datetime;
      CREATE PROPERTY url: std::str;
  };
  CREATE TYPE default::GitHubRepo {
      CREATE MULTI LINK issues: default::Issue;
      CREATE PROPERTY createdAt: std::datetime;
      CREATE PROPERTY description: std::str;
      CREATE PROPERTY forksCount: std::int64;
      CREATE PROPERTY fullName: std::str;
      CREATE PROPERTY hasIssues: std::bool;
      CREATE PROPERTY homepage: std::str;
      CREATE PROPERTY issueCommentUrl: std::str;
      CREATE PROPERTY issuesUrl: std::str;
      CREATE PROPERTY language: std::str;
      CREATE PROPERTY name: std::str;
      CREATE PROPERTY openIssuesCount: std::int64;
      CREATE PROPERTY owner: std::str;
      CREATE PROPERTY ownerUrl: std::str;
      CREATE PROPERTY pushedAt: std::datetime;
      CREATE PROPERTY stargazersCount: std::int64;
      CREATE PROPERTY subscribersCount: std::str;
      CREATE PROPERTY topics: array<std::str>;
      CREATE PROPERTY updatedAt: std::datetime;
      CREATE PROPERTY url: std::str;
      CREATE PROPERTY visibility: std::str;
      CREATE PROPERTY watchersCount: std::int64;
  };
  CREATE TYPE default::Session {
      CREATE REQUIRED LINK user: default::User {
          ON TARGET DELETE DELETE SOURCE;
      };
      CREATE REQUIRED PROPERTY userId := (.user.id);
      CREATE PROPERTY createdAt: std::datetime {
          SET default := (std::datetime_current());
      };
      CREATE REQUIRED PROPERTY expires: std::datetime;
      CREATE REQUIRED PROPERTY sessionToken: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
  };
  ALTER TYPE default::User {
      CREATE MULTI LINK sessions := (.<user[IS default::Session]);
  };
  CREATE TYPE default::VerificationToken {
      CREATE REQUIRED PROPERTY identifier: std::str;
      CREATE REQUIRED PROPERTY token: std::str {
          CREATE CONSTRAINT std::exclusive;
      };
      CREATE CONSTRAINT std::exclusive ON ((.identifier, .token));
      CREATE PROPERTY createdAt: std::datetime {
          SET default := (std::datetime_current());
      };
      CREATE REQUIRED PROPERTY expires: std::datetime;
  };
};
