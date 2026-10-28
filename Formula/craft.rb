class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.4.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.4.0/craft-darwin-arm64.gz"
      sha256 "9aad41031abc7771012162934752f94df5aa02cdeb9c2fdd65686c1865206f89"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.4.0/craft-darwin-x64.gz"
      sha256 "06e68354063e051fbe60ff0071afe59a4190595f79479521335e3d8d28dbf863"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.4.0/craft-linux-arm64.gz"
      sha256 "b4b0c3c7c83c38dfa5fad0247086d7f89a71d69951036f331fbbebc962f0b970"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.4.0/craft-linux-x64.gz"
      sha256 "8f8534d9331c0cd81f30319c003655a508356f0d1a02b2aef837589c34eef0f7"
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
