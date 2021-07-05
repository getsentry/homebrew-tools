class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.67.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.67.0/sentry-cli-Darwin-universal"
    sha256 "fbcd8394ce67cbf7fe507e4fe11ceeca549fda932f5b4be6993eb8be11409f78"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.0/sentry-cli-Linux-aarch64"
        sha256 "2f2a3650446cf96bf9cae1fd5d22343e52b9bee70c2e22aad911c715a6aaed80"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.0/sentry-cli-Linux-armv7"
        sha256 "acba8fff9e7c08db5a066bd1c88d29f086d56ba6b854b37c593cf5d36d35c14a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.0/sentry-cli-Linux-x86_64"
        sha256 "53faaeb2ea14251173ccf8eb9acdf4dd293f4f9d3d92c9a7b0f4c5e297c8178d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.67.0/sentry-cli-Linux-i686"
        sha256 "c205fea8ac5bdff8ecdefe0324ba4dc110c7b97c7ca79f84d296f6660fcdaa17"
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
