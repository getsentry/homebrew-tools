class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.30.0/sentry-cli-Darwin-x86_64"
  version "1.30.0"
  sha256 "b4fa2c46efe432ec095c23e5e1fd69b4113d0c6816faa1cd9d4cb6f3f1ec3b52"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
