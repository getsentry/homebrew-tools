class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.8.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.8.0/sentry-cli-Darwin-universal"
    sha256 "a2aadaf804fad99ac70f52a32bf1f0ff53327ed52c2a723fea04bbe9cbde3485"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.0/sentry-cli-Linux-aarch64"
        sha256 "652b0a6fb992fac95b80bcc6d2f59868750ac22eb2ff4156d3c8bd646c934c3b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.0/sentry-cli-Linux-armv7"
        sha256 "0c41f307f3f2a69270150b1b8fd41acbbcfbe8730610d3a7dd8bdd7aecac6613"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.0/sentry-cli-Linux-x86_64"
        sha256 "bbbd739afc0d8a6736ae45e5f6fcd6db87f7abf45de9fa76e5621834f2dfd15d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.8.0/sentry-cli-Linux-i686"
        sha256 "b543cf7394a0516fa85d69a63a8f0a91a5aa3ccceb5d40355193f8491224b1bf"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
