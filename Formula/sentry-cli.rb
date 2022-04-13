class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.0.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.0.2/sentry-cli-Darwin-universal"
    sha256 "60b03ee1316558dd5b0317e7e14876595672eb3b6a22ceb40b3d73a656a9b34b"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.2/sentry-cli-Linux-aarch64"
        sha256 "df81846e4969b2acbad8d70810eca6d6621b69b16b2e3497f437955849489887"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.2/sentry-cli-Linux-armv7"
        sha256 "bd5cee95cec37fe4c3d4be98d7aba928393cdceba295676907e5f40eb2817e9d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.2/sentry-cli-Linux-x86_64"
        sha256 "b88ae7e44706772812864f8f9a56871cb984bd478b7de8b583bbf3442fad4c1c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.0.2/sentry-cli-Linux-i686"
        sha256 "6c60b9718571843a14a57463d2f2939aad44428db8bb6e6d26897e5fb8748e5f"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
