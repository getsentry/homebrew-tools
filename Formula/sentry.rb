class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.32.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.32.0/sentry-darwin-arm64.gz"
      sha256 "323eb941c8277050d361103a05afb334b7105f3d01a0997cbb82e0bd416b9a09"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.32.0/sentry-darwin-x64.gz"
      sha256 "62535831abe28856434cdff04744724dfa4919a80a5b5f0a4fd2d93f5bca7f9a"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.32.0/sentry-linux-arm64.gz"
      sha256 "499b792c13322b61ae5933256c976505d715f805490e36a9a0a01112e5cc0586"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.32.0/sentry-linux-x64.gz"
      sha256 "b36b26dbfcdfe915a905eb8cc0792d4df430cba2407b2b6970e535c1b3059933"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
  end

  def post_install
    system bin/"sentry", "cli", "setup", "--method", "brew", "--no-modify-path"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry --version").chomp
  end
end
