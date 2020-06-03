class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.54.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.54.0/sentry-cli-Darwin-x86_64"
    sha256 "ce23dbffa1d1b3f3e3334ebaa8d43277e8f8496ca8a105e9e3bd0221429478db"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.54.0/sentry-cli-Linux-x86_64"
    sha256 "f76446fff0594544a2e6e4fa41c6f3d2e7451a5f05eb3112daba91f861b43c29"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.54.0/sentry-cli-Linux-i686"
    sha256 "e46c7a25fb140a1d3b4440c2a2ce2b9dd22ee67ef975033d07c86b74f6a0e466"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
