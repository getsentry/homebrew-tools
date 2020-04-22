class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.52.2"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.2/sentry-cli-Darwin-x86_64"
    sha256 "ccb08b406f0a17ac2c53144fba4d32273beeee0e27f734f04dd021df57d895e3"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.2/sentry-cli-Linux-x86_64"
    sha256 "9c6bd82a643c39643c40758d71a165c562faed06a7c2bb9c14ca4e0eb36586e4"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.52.2/sentry-cli-Linux-i686"
    sha256 "e7258371d1d48ed31d1b0d3ff87837736e2797ff0f18eb8b7b485abafbc88916"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
