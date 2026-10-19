class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "2.35.1"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/2.35.1/craft-darwin-arm64.gz"
      sha256 "b519457e205cc43ed39793f04c3580fb9b4e39a1581f0a302cf5acfca5fbb9e8"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/2.35.1/craft-darwin-x64.gz"
      sha256 "dc5d6a3fd48c643a909d37a3bfb9f87b6fb7bf58243c933e6557b6a4e015a891"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/2.35.1/craft-linux-arm64.gz"
      sha256 "ca447e58aa20ed5f03267ce88b4036f9b9429f4d18d4bef23b1ad6921ed890af"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/2.35.1/craft-linux-x64.gz"
      sha256 "22c3f3eb527bbcdcc4cdd32a3eb9ae0196448ce103a93915746849d9abf964de"
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
