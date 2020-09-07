class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.56.1"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.56.1/sentry-cli-Darwin-x86_64"
    sha256 "295abe2183de32beb2252b75c26f50fb78422cfbf1113e6bb71ce2534ea4962a"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.56.1/sentry-cli-Linux-x86_64"
    sha256 "801a366557e29afb46aa110e43568def2a5f219dcd6bd606f4816e0e84668ad5"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.56.1/sentry-cli-Linux-i686"
    sha256 "59ea17dce62b5b7c25085e501a2401ef6ae2480e50726fae69dd3ee5f9beb2f9"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
