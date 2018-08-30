class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.35.2/sentry-cli-Darwin-x86_64"
  version "1.35.2"
  sha256 "d98828398f596ce1a6465fa9264534ceb318a2b148ab185f080a8e9c4c42a1c7"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
