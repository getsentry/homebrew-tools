class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.51.1"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.51.1/sentry-cli-Darwin-x86_64"
    sha256 "2fe8bcb052706153ff9e85e0af804ac1a35178c00d1efa9a5d66e418be8724df"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.51.1/sentry-cli-Linux-x86_64"
    sha256 "b0a78458842ce6d7febe871ccadbe064f7bed27ef6b6f38a00d1faa7bfe59fd4"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.51.1/sentry-cli-Linux-i686"
    sha256 "b0dc89bd9df6ba5cf5a7c21890d559fd47a25fd6d6b607b4942e9bfffb9b271b"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
