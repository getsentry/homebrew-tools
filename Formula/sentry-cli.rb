class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.57.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.57.0/sentry-cli-Darwin-x86_64"
    sha256 "c71ec43ae9dc6264500b97a820fa801d284e930d8366fc110e0cbb942601acc6"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.57.0/sentry-cli-Linux-x86_64"
    sha256 "d8587f98d533bd0a9cbc8dc080ed60d7e1e01a0c65416317fcea7475f6c1d5fe"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.57.0/sentry-cli-Linux-i686"
    sha256 "ad44593fb892958a20c9ca29ade24afa70b3af7674dad5d4c7eee90a1d05745c"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
