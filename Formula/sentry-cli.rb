class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.49.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.49.0/sentry-cli-Darwin-universal"
    sha256 "1206cd2890cc085b062497f406c361fc04b8c109a93f34cb0abfbb1884d702e3"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.49.0/sentry-cli-Linux-aarch64"
        sha256 "7af5d3cd3e5bfc60af6446c0e51a48e26aae44565d37da9b558db7536a2dc1ca"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.49.0/sentry-cli-Linux-armv7"
        sha256 "37a5cee041d6033f5692d7c0b0c4faa64b4e518775fbc0519d5a730a97f13a59"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.49.0/sentry-cli-Linux-x86_64"
        sha256 "be4a9b22e8ac782728b2bf62a3bc61b2dcf20dae9c68acfc94ebaa8019ed5d78"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.49.0/sentry-cli-Linux-i686"
        sha256 "4279f33dc30f0c85dda9284eb77f5226d9a9095e17f5dc9e210b1d0af371a1bd"
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
