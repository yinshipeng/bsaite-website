#!/bin/bash

# 一键启动脚本 - 编译并启动生产网站
# 使用方法: ./start.sh [http|https] [--background|-b]

# 设置颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 默认模式
MODE=${1:-http}
BACKGROUND=false

# 检查是否有后台运行参数
if [[ "$2" == "--background" || "$2" == "-b" ]]; then
    BACKGROUND=true
fi

echo -e "${GREEN}🚀 芭赛特网站一键启动脚本${NC}"
echo -e "${YELLOW}模式: $MODE${NC}"
if [ "$BACKGROUND" = true ]; then
    echo -e "${YELLOW}运行方式: 后台运行${NC}"
fi

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
    
    if [ "$BACKGROUND" = true ]; then
        nohup caddy run --config caddy.json > caddy.log 2>&1 &
        echo -e "${GREEN}✅ Caddy已在后台启动，日志保存在 caddy.log${NC}"
        echo -e "${YELLOW}查看日志: tail -f caddy.log${NC}"
        echo -e "${YELLOW}停止服务: pkill caddy${NC}"
    else
        caddy run --config caddy.json
    fi
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
    
    if [ "$BACKGROUND" = true ]; then
        nohup caddy run --config caddy.json > caddy.log 2>&1 &
        echo -e "${GREEN}✅ Caddy已在后台启动，日志保存在 caddy.log${NC}"
        echo -e "${YELLOW}查看日志: tail -f caddy.log${NC}"
        echo -e "${YELLOW}停止服务: pkill caddy${NC}"
    else
        caddy run --config caddy.json
    fi
}

# 停止服务
stop_service() {
    echo -e "${YELLOW}🛑 停止Caddy服务...${NC}"
    pkill caddy 2>/dev/null || echo -e "${YELLOW}Caddy未运行${NC}"
    echo -e "${GREEN}✅ Caddy服务已停止${NC}"
}

# 查看状态
status_service() {
    if pgrep caddy > /dev/null; then
        echo -e "${GREEN}✅ Caddy正在运行${NC}"
        echo -e "${YELLOW}进程ID: $(pgrep caddy)${NC}"
    else
        echo -e "${RED}❌ Caddy未运行${NC}"
    fi
}

# 查看日志
view_logs() {
    if [ -f caddy.log ]; then
        echo -e "${YELLOW}📋 查看Caddy日志...${NC}"
        tail -f caddy.log
    else
        echo -e "${RED}❌ 日志文件不存在${NC}"
    fi
}

# 主程序
main() {
    case $1 in
        "http")
            check_dependencies
            install_dependencies
            start_http
            ;;
        "https")
            check_dependencies
            install_dependencies
            start_https
            ;;
        "stop")
            stop_service
            ;;
        "status")
            status_service
            ;;
        "logs")
            view_logs
            ;;
        *)
            echo -e "${RED}❌ 无效的模式: $1${NC}"
            echo -e "${YELLOW}使用方法:${NC}"
            echo -e "${YELLOW}  ./start.sh http [--background|-b]    # 启动HTTP生产服务器${NC}"
            echo -e "${YELLOW}  ./start.sh https [--background|-b]   # 启动HTTPS生产服务器${NC}"
            echo -e "${YELLOW}  ./start.sh stop                      # 停止服务${NC}"
            echo -e "${YELLOW}  ./start.sh status                    # 查看服务状态${NC}"
            echo -e "${YELLOW}  ./start.sh logs                      # 查看日志${NC}"
            exit 1
            ;;
    esac
}

# 执行主程序
main "$@"
