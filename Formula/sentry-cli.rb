class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.60.1"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.60.1/sentry-cli-Darwin-x86_64"
    sha256 "37a296aeb7257c36d554c7d1e16d3b128b8fb2b8e69be71732c68955b24db4b0"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.60.1/sentry-cli-Linux-x86_64"
    sha256 "7d9d67155cb2e7cbbd3eb17ef3abae40296a730e9cf9f5055cbe49b7ca4dfa83"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.60.1/sentry-cli-Linux-i686"
    sha256 "91053168f1b787cc91e4317ad74a99eff6610714c018793db393502dde1e49bc"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
