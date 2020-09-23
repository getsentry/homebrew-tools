class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.58.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.58.0/sentry-cli-Darwin-x86_64"
    sha256 "2452a0ab81f56c46c6bb2c496a9e250bb4786c855975aa71db29697ec0c6e9ac"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.58.0/sentry-cli-Linux-x86_64"
    sha256 "c8613c154c5d6b943b2b1c72472c5354051c7f600fe568d996001cd9382b54cd"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.58.0/sentry-cli-Linux-i686"
    sha256 "bfd73e1be819a5424edb7aba6293f5929f799870f1f1933b0b0c773d01e50514"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
