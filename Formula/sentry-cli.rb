class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.17.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.17.1/sentry-cli-Darwin-universal"
    sha256 "ac25c90ba04411bf8d75035a4de4195a2a5ef9ea6d1067128fc76c1dcd2d973c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.1/sentry-cli-Linux-aarch64"
        sha256 "484f0c59c85663c49a0b190fc4dd439ee8b0fc5a9a353e0681ace392d6875744"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.1/sentry-cli-Linux-armv7"
        sha256 "8894b48934ded383376701a0daa0ac04037846203373f6ec50ff191468add6b4"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.1/sentry-cli-Linux-x86_64"
        sha256 "7f6a7f1abbd3f3012ec24373b323ec8e9c400057a45edddc47941be8bc5729ac"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.1/sentry-cli-Linux-i686"
        sha256 "e0064c765f446a8f17c49c93ba8615a70ddb3fa077633a3c1b29c42286697065"
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
