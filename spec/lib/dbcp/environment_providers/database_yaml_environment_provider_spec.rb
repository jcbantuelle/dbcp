require 'spec_helper'

describe Dbcp::DatabaseYamlEnvironmentProvider do
  subject { Dbcp::DatabaseYamlEnvironmentProvider.new path }
  let(:path) { File.expand_path('../../../../fixtures/config/database.yml', __FILE__) }

  describe "#find" do
    context "when environment exists" do
      it "returns an environment" do
        environment = subject.find 'development'
        expect(environment).to be_a Dbcp::Environment
        expect(environment.database).to be_a Dbcp::Database
        expect(environment.environment_name).to  eq 'development'
        expect(environment.database.adapter).to  eq 'postgresql'
        expect(environment.database.database).to eq 'dev_database'
        expect(environment.database.username).to eq 'dev_username'
        expect(environment.database.password).to eq 'dev_password'
      end
    end
    context "when environment doesn't exist" do
      specify { expect(subject.find 'does-not-exist').to be_nil }
    end
    context "when file doesn't exist" do
    let(:path) { File.expand_path('../../../../fixtures/config/database-does-not-exist.yml', __FILE__) }
      specify { expect(subject.find 'development').to be_nil }
    end
  end
end