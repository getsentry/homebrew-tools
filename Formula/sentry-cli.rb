class SentryCli < Formula
  desc "This is a Sentry command-line client for some generic tasks."
  homepage "https://github.com/getsentry/sentry-cli"
  url "https://github.com/getsentry/sentry-cli/releases/download/1.27.0/sentry-cli-Darwin-x86_64"
  version "1.27.0"
  sha256 "16ffabb5403f64f93cc07b8675b7f32f88905a4d47f17eb61282b3376bf532d9"

  def install
    mv "sentry-cli-Darwin-x86_64", "sentry-cli"
    bin.install "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
