class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.68.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.68.0/sentry-cli-Darwin-universal"
    sha256 "da0a3a83ba860be4fa917c95b4573c0d5aacb161bb406722f6ef668e1b350883"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.68.0/sentry-cli-Linux-aarch64"
        sha256 "d4bb6d3234a1674c355e1b73db5000c7a4599cd5d31eb5cdccb7cc22c8007e00"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.68.0/sentry-cli-Linux-armv7"
        sha256 "580923b206b990dd294e499b600303c6ab0f3aa0f346cc3bcfde8c954161a194"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.68.0/sentry-cli-Linux-x86_64"
        sha256 "218191471856b11382d38ea6a7e9663d42ce3b50f9b1d5b8a7156b598b8c9e7c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.68.0/sentry-cli-Linux-i686"
        sha256 "4102daaa35c30837e911ff71a6cb1d4dc61e3daa439bb1676e94766a50059bc5"
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
