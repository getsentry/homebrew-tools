class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.11.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.11.0/craft-darwin-arm64.gz"
      sha256 "fdc69d8201687d45108bf214aea83ee4ce7578e4aa4dfa70fed682a975d147f4"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.11.0/craft-darwin-x64.gz"
      sha256 "d5856cce4bbf15c68490c1b746527047da69669d94ab065db7a6031bb59d4ed7"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.11.0/craft-linux-arm64.gz"
      sha256 "129c602595f4f4aec1f6de1816bd8b229884e49ca8d1f17cea364ac344d5dbda"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.11.0/craft-linux-x64.gz"
      sha256 "a43b272ec2ecc08f2a3f799b1c6ad19b7d295149569ddd60fb8cc30416377938"
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
