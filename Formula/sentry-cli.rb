class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.52.4"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.4/sentry-cli-Darwin-x86_64"
    sha256 "fb83ef45878dbe7d2cb726b7c7d7c8da1ba6ed0a5255a94586b3fa0e5e88be62"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.4/sentry-cli-Linux-x86_64"
    sha256 "0f53312261df3fdfaddc7d1a93ff89a8bdaa0e90974a9d7ed0348f48bfb070f7"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.4/sentry-cli-Linux-i686"
    sha256 "cbf5a32a887f2f4036180d3e4962931693370e8f6bbaac1033756371e1bc4717"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
