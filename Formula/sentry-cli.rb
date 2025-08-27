class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.53.0-alpha"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0-alpha/sentry-cli-Darwin-universal"
    sha256 "bd9f0afce0a38d1854205c0b608a7a336b287686aeb3be39753a9a92ba8b9dce"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0-alpha/sentry-cli-Linux-aarch64"
        sha256 "a432521cd699c8d4ace732f8002b0f25ee4b458baae9c5d184fb3144b13a257c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0-alpha/sentry-cli-Linux-armv7"
        sha256 "91001894587f5569999a82068b101b0302aaaf0acbda7b314462e1b533b6863c"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0-alpha/sentry-cli-Linux-x86_64"
        sha256 "4e9b7d4455218d66efdbdaf7408796ba0845480fb79f2e2364d8d55da0bca3f0"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0-alpha/sentry-cli-Linux-i686"
        sha256 "205e4ba22e5a3882bf83d9b7a0a8d9a5259ddbe8957db577a9df65c48270516c"
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
