class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.56.0"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.56.0/sentry-cli-Darwin-x86_64"
    sha256 "c7d10b8bb8dae56792e46e312811455bf950d6bb6798df5c31bdbec743166e47"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.56.0/sentry-cli-Linux-x86_64"
    sha256 "f525b632306d004213791a114752f88fe2b08a8174a6887beacac49a77d851d1"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.56.0/sentry-cli-Linux-i686"
    sha256 "4b69395175aafa628ad695ad998a82a73383512f722fa25d5b6ef5c341915565"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
