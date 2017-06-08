class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.13.3/sentry-cli-Darwin-x86_64"
  version "1.13.3"
  sha256 "07afd97875cb36cb4790a0443cbdeaf7343e64aa59a5776e12b236fcdbad3629"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
