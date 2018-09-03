class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.35.4/sentry-cli-Darwin-x86_64"
  version "1.35.4"
  sha256 "b77b57bdec74a9fd625bec8a06695e16c3d7027fe8a7ccafa27d7bbc3e4cfedc"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
