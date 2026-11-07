class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.11.2"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.11.2/craft-darwin-arm64.gz"
      sha256 "0ef876d99cb16a53cab8225f91926c3b9d1cbb053bc3c1d231611aff53d51545"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.11.2/craft-darwin-x64.gz"
      sha256 "98fc3dd1f3cb5a865fa9b0a654a6c186ea4ec9c91b089c5b662d48b20e434f13"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.11.2/craft-linux-arm64.gz"
      sha256 "485dce2950ad8dd18f91db9862e596ef6a57e793d59332ef010a6e59c3531c00"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.11.2/craft-linux-x64.gz"
      sha256 "ac825bef3eb8fe68f28c0d1011c26d5d516a89399c76341664b0f52d4c250470"
    else
      raise "Unsupported Linux CPU architecture"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["craft-*"].first => "craft"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/craft --version").chomp
  end
end
