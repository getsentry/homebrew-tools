class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.42.1"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.42.1/sentry-cli-Darwin-universal"
    sha256 "f3181bfca1e7bf6918538a2dfa1f1f40d1c403a4780fc705f428bbec3e4808b2"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.1/sentry-cli-Linux-aarch64"
        sha256 "672fe1d63d6ebbf4b8c59c43e1b75869367378f05088843cf6641562a8c446e2"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.1/sentry-cli-Linux-armv7"
        sha256 "d23d3b730ebf47002d65c802189f65473eac9bd99bd8f1d32438696214cb52d0"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.1/sentry-cli-Linux-x86_64"
        sha256 "b9d7e2471e7860323f77c6417b6e402c49deacba0f961429a1b95dd245fb9607"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.42.1/sentry-cli-Linux-i686"
        sha256 "41ff53c447175252ef179852157b2e01a2dac256b72257b69fff214b13b93e7c"
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
