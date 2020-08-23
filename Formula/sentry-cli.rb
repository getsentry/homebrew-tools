class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.55.2"

  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.2/sentry-cli-Darwin-x86_64"
    sha256 "abafc388a2ba0484b91ec4cba6fc289494f602513519462fb51666d2ae212275"
  elsif Hardware::CPU.is_64_bit?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.2/sentry-cli-Linux-x86_64"
    sha256 "21400fc5ae865136ef50472f9cf5ee68fec198917ef52b959ee825d28de75cbb"
  else
    url "https://downloads.sentry-cdn.com/sentry-cli/1.55.2/sentry-cli-Linux-i686"
    sha256 "7dd2068b3fc87f3691cafa2961698ae4a81d21ed4b2b21004898a3000dabd45b"
  end

  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
