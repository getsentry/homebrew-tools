class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.14.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.14.0/craft-darwin-arm64.gz"
      sha256 "886f76a390b65b722ddfec55b8157c9b5d41d3cf5921a654253f22308e0f1d8d"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.14.0/craft-darwin-x64.gz"
      sha256 "a30b1b51a76a51486d98aff6d71cba8a273547dcdf40359b5e37f0b27d064589"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.14.0/craft-linux-arm64.gz"
      sha256 "2fa5ee283eea24ffcecf3c54d620f8381382fe1573ba6256deb93519a701dc68"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.14.0/craft-linux-x64.gz"
      sha256 "820c752c2cc42f879c27223224c56ac97307a73d1358c3515c5bcf12d1b22e2b"
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
