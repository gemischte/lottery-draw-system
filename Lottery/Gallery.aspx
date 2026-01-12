<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Lottery.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <title>卡牌圖鑑</title>
    <style>
        .card-item {
            display: inline-block;
            margin: 12px;
            text-align: center;
        }

        .card-img {
            width: 120px;
            height: 160px;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }

            .card-img:hover {
                transform: scale(1.05);
            }

        .card-placeholder {
            width: 120px;
            height: 160px;
            background-color: #ccc;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #666;
            box-shadow: inset 0 0 10px #aaa;
        }

        .card-name {
            font-weight: bold;
            margin-top: 5px;
        }

        .card-count {
            font-size: 0.85em;
            color: #444;
        }
        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.8);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            max-width: 80%;
            max-height: 90%;
            border-radius: 12px;
            box-shadow: 0 0 20px #fff;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form id="form1" runat="server">
        <h2 style="text-align: center;">卡牌圖鑑</h2>
        <div class="card-grid">
            <asp:Repeater ID="rptGallery" runat="server">
                <ItemTemplate>
                    <div class="card-item">
                        <%# (int)Eval("DrawCount") > 0 ?
 $"<img src='{Eval("ImagePath")}' alt='{Eval("Name")}' class='card-img' onclick='showModal(this)' />" :
 "<div class='card-placeholder'>未獲得</div>"
                        %>
                        <div class="card-name"><%# Eval("Name") %></div>
                        <div class="card-count">
                            <%# (int)Eval("DrawCount") > 0 ? $"抽到 {(int)Eval("DrawCount")} 張" : "尚未抽到" %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <!-- Modal 放大圖片 -->
            <div id="imgModal" class="modal" onclick="hideModal()">
                <img id="modalImg" class="modal-content" />
            </div>
        </div>
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentJS" runat="server">
    <script>
        function showModal(img) {
            var modal = document.getElementById("imgModal");
            var modalImg = document.getElementById("modalImg");
            modal.style.display = "flex";
            modalImg.src = img.src;
        }
        function hideModal() {
            document.getElementById("imgModal").style.display = "none";
        }
    </script>
</asp:Content>
