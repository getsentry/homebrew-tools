class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.35.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.35.0/sentry-cli-Darwin-universal"
    sha256 "594c49bcc877d309bb08de39d97c2fb9ad53158d2d059a1242c3f808ec6bdc79"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.35.0/sentry-cli-Linux-aarch64"
        sha256 "36cf2f21865bd28cb7b673dfeedf0982757a5375b8e702418706c859b91adee8"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.35.0/sentry-cli-Linux-armv7"
        sha256 "427e0927271cc61e5823f07447399286d4598f48bbc770490c7c0203208dc139"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.35.0/sentry-cli-Linux-x86_64"
        sha256 "968b3b623867ab83c0163e8d8e9f21007e2f7dbaa248a8890798c9f4e098f69c"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.35.0/sentry-cli-Linux-i686"
        sha256 "b2d433f72669cc5995b2de06574c607ec7dc0bd3ce2374013cf2beba3ad38306"
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
