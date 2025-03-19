class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.42.4"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.42.4/sentry-cli-Darwin-universal"
    sha256 "fea9491bd9038fe0343318b5459ad256d1f1b1794bd03b1d78db8f3d8700f47b"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.4/sentry-cli-Linux-aarch64"
        sha256 "134c9e2b21d341a19710c90eaadb6dc817230f13edbb11a3ec9e41f04d118066"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.4/sentry-cli-Linux-armv7"
        sha256 "24efad8053b17710d3f67887cb0aad3490b3f38825a9d1d95f255bc952987087"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.4/sentry-cli-Linux-x86_64"
        sha256 "6d61432bc47f78fcfeb615302a58796e5d135f1471d5b9bc7dde576b1ac956b6"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.4/sentry-cli-Linux-i686"
        sha256 "0316e17671cf661ca1167793d4b2ddecf8d231aa557e89193201de3db8233823"
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
