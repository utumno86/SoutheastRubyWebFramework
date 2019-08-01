RSpec.describe Roolz do
  it "has a version number" do
    expect(Roolz::VERSION).not_to be nil
  end

  it "does something useful" do
    env = { "PATH_INFO" => "/",
    "QUERY_STRING" => "" }

    expect(::Roolz::App.new.call(env)[0]).to eq(200)
  end
end
