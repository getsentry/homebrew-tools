class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.17.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.17.0/sentry-cli-Darwin-universal"
    sha256 "17d96bdb4e669b0d6201871df039e3b496110f6328ff92b44c04b94c0dd85755"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.0/sentry-cli-Linux-aarch64"
        sha256 "44f1ece813e094cf77e01f18ec23b038ee9704de45b3f2399c3ba46645407560"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.0/sentry-cli-Linux-armv7"
        sha256 "7c1731f455abb1a94203aafa22674361dbd89f64febe4ef95389093754bac85d"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.0/sentry-cli-Linux-x86_64"
        sha256 "bf5cbfc1b4309062ceb474d5ad7d31c23473cfe936c20226de1c0b374261458f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.17.0/sentry-cli-Linux-i686"
        sha256 "70d442ffbba3abad3a1fe0b5943b838450a275d24b178d8f1f23a5ecea66a8fc"
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
