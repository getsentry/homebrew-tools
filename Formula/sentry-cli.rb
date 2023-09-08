class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.20.7"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.20.7/sentry-cli-Darwin-universal"
    sha256 "7f09d34752c92a5ae7a00f75196c576365aba3cf78f9e6a1a5e937fa90ed3f84"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.7/sentry-cli-Linux-aarch64"
        sha256 "deab6568a7c5ba5af03674e23b3afc26f439b8d7b1f32c04f955c5af1a7552f7"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.7/sentry-cli-Linux-armv7"
        sha256 "6649a93054089ad221df6117cd0be27142ec8498e3af0052c54fc828937c15ee"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.7/sentry-cli-Linux-x86_64"
        sha256 "5cd1c556bb33854e2c30f2c02beb8fefcc9da03212285ede9b4550820285beb1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.20.7/sentry-cli-Linux-i686"
        sha256 "2eabb88956917337f36e40f68d410dfaf5b348503de0107d2b4e527346c2a0a5"
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
