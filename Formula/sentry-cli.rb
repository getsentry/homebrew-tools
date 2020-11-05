class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.59.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.59.0/sentry-cli-Darwin-x86_64"
    sha256 "f64b1e090137bdc3a21c53a537b513da59e6db86215a7d07cc4d7c9004a05954"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.59.0/sentry-cli-Linux-x86_64"
    sha256 "2e7ee985fa76d8680aa13eca9c7efc5d8f28b1c51d34cfcb323fbe5250108614"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.59.0/sentry-cli-Linux-i686"
    sha256 "1915bb07a6c359da5f23e32f29b3150a2b28be4156a9bcae6bc4e99562d62a2b"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
