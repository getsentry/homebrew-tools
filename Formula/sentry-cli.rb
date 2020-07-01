class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.55.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.0/sentry-cli-Darwin-x86_64"
    sha256 "c0249ab6ad5cabd01ee2974cded97831dc813575596cf086ca0e810dfcbbf20b"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.0/sentry-cli-Linux-x86_64"
    sha256 "222d294491375b87473688156ba87fee76853ebefaa62718089dffea9a8c8f6b"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.0/sentry-cli-Linux-i686"
    sha256 "2422bab7cf1d2d49dbcac1ac48303eb4cd71c8eda66464a43a6527a83b5edaed"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
