class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.30.5"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.30.5/sentry-cli-Darwin-universal"
    sha256 "030f8c6e153b9747e5a4f4f27ace2077c76a0a609be6c320c6ee4d3b681627bc"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.5/sentry-cli-Linux-aarch64"
        sha256 "75d16f98bced12429d2cdf9d6fb99541cea15c55249d132ccf2595aab31852e9"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.5/sentry-cli-Linux-armv7"
        sha256 "bfe782507a809dc5561defeeb52230b38c9b07da9d7963ea6dbd6f5943457a72"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.5/sentry-cli-Linux-x86_64"
        sha256 "9956496dc087853587454f6db3abb0c321d206413da3b13281c2222fad5b20e1"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.30.5/sentry-cli-Linux-i686"
        sha256 "f10c5ec5a6817227960e157b63bf5edcc59135f13cc0630b39dba6c87bcf559e"
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
