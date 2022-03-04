class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.73.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.73.2/sentry-cli-Darwin-universal"
    sha256 "2b7406c9ddd978ed7828a8491cdf2fa4fa4b83c232b6cda52e0b23caaac6452c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.2/sentry-cli-Linux-aarch64"
        sha256 "e9941a53eec7cca900582bbbbba63744295840be65d83aad34467c5eb747d881"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.2/sentry-cli-Linux-armv7"
        sha256 "9a7ccbb6b732656a6e0754d86552e37e794972ed91a1383be39b9ced6f0b5d28"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.2/sentry-cli-Linux-x86_64"
        sha256 "be5b856087324cb5d270c356c276ee48eecdbef591db155efabaf20576100d07"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.73.2/sentry-cli-Linux-i686"
        sha256 "f09d66e4f640a2a2aeed72be98ddd2547846cca81a309ae056d26360fb7a87af"
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
