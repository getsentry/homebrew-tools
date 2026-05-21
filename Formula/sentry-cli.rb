class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.4.3"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.4.3/sentry-cli-Darwin-universal"
    sha256 "f544fd8268045bb600440bfe611c34b5c00ebd99bb4f3e157084ebeeb2f220f8"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.3/sentry-cli-Linux-aarch64"
        sha256 "0247f0c761ff10885c2eea3cbccbf3401289d9563873d5de57ebba5e0699f30e"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.3/sentry-cli-Linux-armv7"
        sha256 "b25325d15ef61e5266587ddbe1533e1b4b676842e34e0da7983be49d1e64a70a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.3/sentry-cli-Linux-x86_64"
        sha256 "59de7da8e90b3511c06d805a2153b083468eef85aa559feccb468cc683da52aa"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.4.3/sentry-cli-Linux-i686"
        sha256 "2257b9515cda8045eb3bfdc66255de9fb4340008e763ac94ce778cb3a0c1cc4d"
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
