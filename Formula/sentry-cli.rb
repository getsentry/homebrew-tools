class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.74.6"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.74.6/sentry-cli-Darwin-universal"
    sha256 "fd667d9f5f89f2e5f2b7bb0287a009cadddb3d200bffa09c1fa8b0887c207fc3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.6/sentry-cli-Linux-aarch64"
        sha256 "fc6c4c0fbe2d2aad4fa8a65f363665e16ced56a3372e09d6c51ff080c2472a76"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.6/sentry-cli-Linux-armv7"
        sha256 "84d9b76284c6c9ef1950dadfa0c2aa0e8f77be083536117082c9da81457eb9e3"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.6/sentry-cli-Linux-x86_64"
        sha256 "ee4bd836f4fcc51bb3d7a05003d42e04f874e6ae1578877112acdb97181efd71"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.74.6/sentry-cli-Linux-i686"
        sha256 "d75b8c876ee86718c918c47b72c86c21db14598ce2d953e73d7f94e02e54043b"
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
