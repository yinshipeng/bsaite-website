#!/bin/bash

# 一键启动脚本 - 编译并启动生产网站
# 使用方法: ./start.sh [http|https]

# 设置颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 默认模式
MODE=${1:-http}

echo -e "${GREEN}🚀 芭赛特网站一键启动脚本${NC}"
echo -e "${YELLOW}模式: $MODE${NC}"

# 检查依赖
check_dependencies() {
    echo -e "${YELLOW}📋 检查依赖...${NC}"
    
    # 检查Node.js
    if ! command -v node &> /dev/null; then
        echo -e "${RED}❌ Node.js 未安装${NC}"
        exit 1
    fi
    
    # 检查pnpm
    if ! command -v pnpm &> /dev/null; then
        echo -e "${RED}❌ pnpm 未安装${NC}"
        echo -e "${YELLOW}请安装: npm install -g pnpm${NC}"
        exit 1
    fi
    
    # 检查Caddy
    if ! command -v caddy &> /dev/null; then
        echo -e "${RED}❌ Caddy 未安装${NC}"
        echo -e "${YELLOW}请安装: https://caddyserver.com/docs/install${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✅ 所有依赖已安装${NC}"
}

# 安装依赖
install_dependencies() {
    echo -e "${YELLOW}📦 安装项目依赖...${NC}"
    pnpm install
    echo -e "${GREEN}✅ 依赖安装完成${NC}"
}

# 生产模式 - HTTP
start_http() {
    echo -e "${YELLOW}🏗️  构建生产版本...${NC}"
    
    # 清理旧构建
    rm -rf .output dist
    
    # 构建项目
    pnpm build
    
    echo -e "${GREEN}✅ 构建完成${NC}"
    
    # 确保输出目录存在
    mkdir -p .output/public
    
    echo -e "${YELLOW}🚀 启动HTTP生产服务器...${NC}"
    echo -e "${GREEN}🌐 访问: http://localhost${NC}"
    
    caddy run --config caddy.json
}

# HTTPS模式
start_https() {
    echo -e "${YELLOW}🏗️  构建生产版本...${NC}"
    
    # 清理旧构建
    rm -rf .output dist
    
    # 构建项目
    pnpm build
    
    echo -e "${GREEN}✅ 构建完成${NC}"
    
    # 确保输出目录存在
    mkdir -p .output/public
    
    echo -e "${BLUE}🔒 启动HTTPS生产服务器...${NC}"
    echo -e "${BLUE}📋 使用自签名证书，浏览器会显示安全警告${NC}"
    echo -e "${BLUE}🌐 访问: https://localhost${NC}"
    echo -e "${BLUE}🌐 HTTP会自动重定向到HTTPS${NC}"
    
    caddy run --config caddy.json
}

# 主程序
main() {
    check_dependencies
    
    case $MODE in
        "http")
            install_dependencies
            start_http
            ;;
        "https")
            install_dependencies
            start_https
            ;;
        *)
            echo -e "${RED}❌ 无效的模式: $MODE${NC}"
            echo -e "${YELLOW}使用方法: ./start.sh [http|https]${NC}"
            echo -e "${YELLOW}  http  - 生产模式 (HTTP)${NC}"
            echo -e "${YELLOW}  https - 生产模式 (HTTPS)${NC}"
            exit 1
            ;;
    esac
}

# 执行主程序
main
