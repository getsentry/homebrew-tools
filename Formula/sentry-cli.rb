class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.52.3"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.3/sentry-cli-Darwin-x86_64"
    sha256 "9192dbfa0aa90266371aa67f8c9ebb710ebd4a5f0a7a130f00ad3da933760a52"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.3/sentry-cli-Linux-x86_64"
    sha256 "5ad013da4abec420a920f0e5ee9b1ade53a579088e272947f0ae63980de08ead"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.3/sentry-cli-Linux-i686"
    sha256 "ee097ba7996ad0ec0fd3dab917b2eda55f25c361b31f659283071bc94d70ee8b"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
