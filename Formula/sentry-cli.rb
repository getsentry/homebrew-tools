class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.4.2"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.4.2/sentry-cli-Darwin-universal"
    sha256 "5e724365cdbbc42e4db7b1a1081adb3764dbdea5f26e94ae2124012cf65a8350"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.2/sentry-cli-Linux-aarch64"
        sha256 "6ccc3b59fae821b54da4a35be12a8893b6a25ba1c0c42f78e275ec57018af3d0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.2/sentry-cli-Linux-armv7"
        sha256 "2ed2f57bb2ee136203ae1632e1b359aa9eff8d28077f66b905c77f3a254976e0"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.2/sentry-cli-Linux-x86_64"
        sha256 "d0718d487f2e408ef7d6689c9ee6e9010cd7e842874641156c932f39857f135d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.2/sentry-cli-Linux-i686"
        sha256 "f0d81697f7af7a51d6ddc361f8ceefe109cd9150b70491f7b6fa5ddba66ad7e2"
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
