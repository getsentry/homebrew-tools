class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.5.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.5.0/craft-darwin-arm64.gz"
      sha256 "7779f5ca839c8e63237630bc19f7aaef70400e304e2c5af9ce936fc196fbd39b"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.5.0/craft-darwin-x64.gz"
      sha256 "f4310587984fe6b6b947ac5e9bc7029cd2391283fd112a47a6457b937d2e4565"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.5.0/craft-linux-arm64.gz"
      sha256 "7f4e2a5b7fe92998bf1ce4b4f40aae2ae03f0d5d4447a10bbf910ecdbb222ee2"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.5.0/craft-linux-x64.gz"
      sha256 "e9cfb55885fbe85bfb2b038cf5042bc355d70bfdcac24d70dc09abece15bdba4"
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
