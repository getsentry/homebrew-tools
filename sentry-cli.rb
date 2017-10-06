class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.21.0/sentry-cli-Darwin-x86_64"
  version "1.21.0"
  sha256 "b41fd6840bf448a0d363f3e8b6341e9a59a7c0697b4e451553ed255ec2fbca06"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
