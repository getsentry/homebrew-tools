class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.22.3"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.22.3/sentry-cli-Darwin-universal"
    sha256 "e27a32541fb11c37e20b8c83407786e80a3593d332101c5c31be9eb80589cf31"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.3/sentry-cli-Linux-aarch64"
        sha256 "ef5d6fcb95a14714bbf401b2685c296efb192b5761ad2dedff2af06fd732cc5d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.3/sentry-cli-Linux-armv7"
        sha256 "c34fde9660e8f7b7213e79882749555e4bc28675c5357153cba74dd30602da87"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.3/sentry-cli-Linux-x86_64"
        sha256 "bcc68cd1de631cbeee481d42391c6646e5fc974293fd3c08fb9e6425077138c9"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.22.3/sentry-cli-Linux-i686"
        sha256 "c621b6a63418d70a5d5bd8ead2b0df54b4eaa0b04efbd4099982304cec82aaf2"
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
