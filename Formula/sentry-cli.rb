class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.15.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.15.2/sentry-cli-Darwin-universal"
    sha256 "e123cf66b2fa2cafdc7e32dbaea98060c8a551f50fe103ad6c2b806f7df87e1c"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.2/sentry-cli-Linux-aarch64"
        sha256 "8d80b70438ba496dc20dccf2c3beeff6ab43fe5e9c461f98b1141981d3058500"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.2/sentry-cli-Linux-armv7"
        sha256 "c6b0cdd2e8dc21c637f30ac5c1b477b88b4e03e5ae3f3972083a118c4672cc4e"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.2/sentry-cli-Linux-x86_64"
        sha256 "80a6fbd0b371aa14715e4fcdc0104ea9f36f249e06edac445920a0a5dc22c16a"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.15.2/sentry-cli-Linux-i686"
        sha256 "2363302bbdf7e2d655e3acbf52229b8a6e90e8f99a2bcac0c4ef926610f93dda"
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
