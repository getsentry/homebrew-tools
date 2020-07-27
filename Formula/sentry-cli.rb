class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.55.1"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.1/sentry-cli-Darwin-x86_64"
    sha256 "848c9c8ff29ffdf57ef548c5a095c9475f6974712f8a7fa60e93ee6b37d3cc36"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.1/sentry-cli-Linux-x86_64"
    sha256 "9f306e78e9bb443fb692324b01b7764b424235302026423dcf47a1f9ceac5a77"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.1/sentry-cli-Linux-i686"
    sha256 "bcf01c25c708f3fdf6931748735bbc4000ed905ed7066ee81a59d3d7313ac146"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
