class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.1.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.1.0/craft-darwin-arm64.gz"
      sha256 "7fb9e507877a63a73ae8e3cbe7f3c6a16051bc2a8565596121eb5eb09187e8b8"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.1.0/craft-darwin-x64.gz"
      sha256 "39287e26c75c4584d417bb2eeb385a414617c973502366ad9fcc39ee08347c4b"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.1.0/craft-linux-arm64.gz"
      sha256 "939b119453f31c39ad58a0dacb67561dd2113adcd7db355be904e8ace6980eac"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.1.0/craft-linux-x64.gz"
      sha256 "c92db3787e167bf356b164fdd10d7973db2afca19c89ea5eb81eded4d32f327a"
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
